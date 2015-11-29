class ApiService

  def initialize(url)
    @url = url
  end

  def get_committee_data
    raw_data = JSON.parse(RestClient.get(@url).force_encoding("utf-8"))["jsonList"]
  end

  def get_congressman_data
    raw_data = JSON.parse(RestClient.get(@url).force_encoding("utf-8"))["jsonList"]
  end

end