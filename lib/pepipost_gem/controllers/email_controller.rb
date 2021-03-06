# pepipost_gem
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module PepipostGem
  # EmailController
  class EmailController < BaseController
    @instance = EmailController.new

    class << self
      attr_accessor :instance
    end

    def instance
      self.class.instance
    end

    # This Endpoint sends emails with the credentials passed.
    # @param [String] api_key Optional parameter: Generated header parameter.
    # Example value ='5ce7096ed4bf2b39dfa932ff5fa84ed9ed8'
    # @param [EmailBody] body Optional parameter: The body passed will be json
    # format.
    # @return SendEmailResponse response from the API call
    def create_send_email(api_key = nil,
                          body = nil)
      # Prepare query url.
      _query_builder = Configuration.base_uri.dup
      _query_builder << '/v2/sendEmail'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8',
        'api_key' => api_key
      }

      # Prepare and execute HttpRequest.
      _request = @http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      _context = execute_request(_request)

      # Validate response against endpoint and global error codes.
      if _context.response.status_code == 405
        raise APIException.new(
          'Method not allowed',
          _context
        )
      end
      validate_response(_context)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_context.response.raw_body)
      SendEmailResponse.from_hash(decoded)
    end
  end
end
