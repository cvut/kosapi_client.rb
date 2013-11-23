module KOSapiClient
  class ResponseConverter

     def process_response(response)
       response = preprocess(response)
       if response.is_paginated?
         items = response.records.map{ |p| convert_type(p) }

       else
         convert_type(response.content)
       end
     end

    def convert_type(response_part)

    end


  end
end
