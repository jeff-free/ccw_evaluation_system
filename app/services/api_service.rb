class ApiService

  def initialize(url)
    @url = url
  end

  def get_committee_data
    raw_data = JSON.parse(RestClient.get(@url).force_encoding("utf-8"))["jsonList"]
  end

  def get_congressman_data
    raw_data = JSON.parse(RestClient.get(@url).force_encoding("utf-8"))["jsonList"]
    # reject{|k, v| [:partyGroup, :leaveFlag, :leaveDate, :onboardDate].include?(k)}
    # raw_data.reject{|k, v| [:partyGroup, :leaveFlag, :leaveDate, :onboardDate].include?(k)}
    # Hash[ raw_data.map {|data| [data["name"], [data["ename"], data["sex"], data["picUrl"], data["tel"], data["committee"], data["experience"]]]} ]
  end
end