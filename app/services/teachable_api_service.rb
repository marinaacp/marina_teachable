class TeachableApiService
  def initialize
    @headers = {
      apiKey: Teachable::TEACHABLE_API_KEY,
      accept: 'application/json',
      content_type: 'application/json'
    }
  end

  def get_all_enrollments(course_id)
    url = "#{Teachable::TEACHABLE_BASE_URL}/courses/#{course_id}/enrollments"
    fetch_all_pages(url)
  rescue Exception => e
    Rails.logger.error(YAML::dump(e))
  end

  def get_one_user(user_id)
    url = "#{Teachable::TEACHABLE_BASE_URL}/users/#{user_id}"
    get_request(url)
  rescue Exception => e
    Rails.logger.error(YAML::dump(e))
  end

  def get_all_courses
    url = "#{Teachable::TEACHABLE_BASE_URL}/courses"
    fetch_all_pages(url)
  rescue Exception => e
    Rails.logger.error(YAML::dump(e))
  end

  def fetch_all_pages(url)
    page = 1
    results = []


    # Do a loop and retrive all pages of data
    loop do
      response = get_request("#{url}?page=#{page}")
      data_key = response.keys.first
      data = response[data_key]
      meta = response["meta"]

      results.concat(data)

      # Check if there are still pegaes to fetch, or if reached the last page then break the loop
      break if meta["page"].to_i >= meta["number_of_pages"].to_i

      # Page count increment
      page += 1
    end
    results
  rescue Exception => e
    Rails.logger.error(YAML::dump(e))
  end

  def get_request(url)
    response = RestClient.get(url, @headers)
    JSON.parse(response.body)
  rescue RestClient::ExceptionWithResponse => e
    Rails.logger.error(YAML::dump(e))
  end
end
