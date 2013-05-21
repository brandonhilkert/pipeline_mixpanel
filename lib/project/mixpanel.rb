module Project
  class Mixpanel
    def initialize(config = Project.config)
      @client = ::Mixpanel::Client.new(
        api_key: config['MIXPANEL_KEY'],
        api_secret: config['MIXPANEL_SECRET'],
        parallel: true
      )
      @today = Date.today.to_s
    end

    def all
      paid_seats_created = paid_segmentation_request 'Seat - Created'
      paid_seats_lost = paid_segmentation_request 'Seat - Lost'
      trial_seats_created = trial_segmentation_request 'Seat - Created'
      trial_seats_lost = trial_segmentation_request 'Seat - Lost'

      @client.run_parallel_requests

      {
         paid: {
           seats_created: extract_stat(paid_seats_created),
           seats_lost: extract_stat(paid_seats_lost),
         },
         trial: {
           seats_created: extract_stat(trial_seats_created),
           seats_lost: extract_stat(trial_seats_lost)
         }
       }
    end

    def paid_segmentation_request(event)
      @client.request('segmentation/sum', {
        event:      "#{event}",
        from_date:  "#{@today}",
        to_date:    "#{@today}",
        on:         'properties["seats"]',
        where:      'properties["account"] == "paid"',
      })
    end

    def trial_segmentation_request(event)
      @client.request('segmentation/sum', {
        event:      "#{event}",
        from_date:  "#{@today}",
        to_date:    "#{@today}",
        on:         'properties["seats"]',
        where:      'properties["account"] == "trial"',
      })
    end

    def extract_stat(request)
      response = request.response.handled_response
      response["results"][@today] || 0
    end
  end
end
