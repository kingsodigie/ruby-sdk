# frozen_string_literal: true

require_relative("./../../core/watson-ruby/personality_insights_v3.rb")
require("json")
require("minitest/autorun")
require("webmock/minitest")

WebMock.disable_net_connect!(allow_localhost: true)

# Unit tests for the Personality Insights V3 Service
class PersonalityInsightsV3Test < Minitest::Test
  def test_plain_to_json
    profile_response = File.read(Dir.getwd + "/resources/personality-v3-expect1.txt")
    personality_text = File.read(Dir.getwd + "/resources/personality-v3.txt")
    headers = {
      "Content-Type" => "application/json"
    }
    expected_response = DetailedResponse.new(status: 200, body: JSON.parse(profile_response), headers: headers)
    stub_request(:post, "https://gateway.watsonplatform.net/personality-insights/api/v3/profile?version=2017-10-13")
      .with(
        body: personality_text,
        headers: {
          "Accept" => "application/json",
          "Authorization" => "Basic dXNlcm5hbWU6cGFzc3dvcmQ=",
          "Content-Type" => "text/plain;charset=utf-8",
          "Host" => "gateway.watsonplatform.net:443"
        }
      ).to_return(status: 200, body: profile_response, headers: headers)
    service = PersonalityInsightsV3.new(
      version: "2017-10-13",
      username: "username",
      password: "password"
    )
    service_response = service.profile(
      content: personality_text,
      content_type: "text/plain;charset=utf-8"
    )
    assert(expected_response.status == service_response.status)
    assert(expected_response.body == service_response.body)
    expected_response.headers.each_key do |key|
      assert(service_response.headers.key?(key))
      assert(expected_response.headers[key] == service_response.headers[key])
    end
  end

  def test_json_to_json
    profile_response = File.read(Dir.getwd + "/resources/personality-v3-expect2.txt")
    personality_text = File.read(Dir.getwd + "/resources/personality-v3.json")
    headers = {
      "Content-Type" => "applicaiton/json"
    }
    expected_response = DetailedResponse.new(status: 200, body: profile_response, headers: headers)
    stub_request(:post, "https://gateway.watsonplatform.net/personality-insights/api/v3/profile?consumption_preferences=true&raw_scores=true&version=2017-10-13")
      .with(
        body: personality_text,
        headers: {
          "Accept" => "application/json",
          "Authorization" => "Basic dXNlcm5hbWU6cGFzc3dvcmQ=",
          "Content-Type" => "application/json",
          "Host" => "gateway.watsonplatform.net:443"
        }
      ).to_return(status: 200, body: profile_response, headers: headers)
    service = PersonalityInsightsV3.new(
      version: "2017-10-13",
      username: "username",
      password: "password"
    )
    service_response = service.profile(
      content: personality_text,
      content_type: "application/json",
      raw_scores: true,
      consumption_preferences: true
    )
    assert(expected_response.status == service_response.status)
    assert(expected_response.body == service_response.body)
    expected_response.headers.each_key do |key|
      assert(service_response.headers.key?(key))
      assert(expected_response.headers[key] == service_response.headers[key])
    end
  end

  def test_json_to_csv
    profile_response = File.read(Dir.getwd + "/resources/personality-v3-expect3.txt")
    personality_text = File.read(Dir.getwd + "/resources/personality-v3.json")
    headers = {
      "Content-Type" => "application/json"
    }
    expected_response = DetailedResponse.new(status: 200, body: profile_response, headers: headers)
    stub_request(:post, "https://gateway.watsonplatform.net/personality-insights/api/v3/profile?consumption_preferences=true&csv_headers=true&raw_scores=true&version=2017-10-13")
      .with(
        body: personality_text,
        headers: {
          "Accept" => "application/json",
          "Authorization" => "Basic dXNlcm5hbWU6cGFzc3dvcmQ=",
          "Content-Type" => "application/json",
          "Host" => "gateway.watsonplatform.net:443"
        }
      ).to_return(status: 200, body: profile_response.to_json, headers: headers)
    service = PersonalityInsightsV3.new(
      version: "2017-10-13",
      username: "username",
      password: "password"
    )
    service_response = service.profile(
      content: personality_text,
      content_type: "application/json",
      accept: "text/csv",
      csv_headers: true,
      raw_scores: true,
      consumption_preferences: true
    )
    assert(expected_response.status == service_response.status)
    assert(expected_response.body == service_response.body)
    expected_response.headers.each_key do |key|
      assert(service_response.headers.key?(key))
      assert(expected_response.headers[key] == service_response.headers[key])
    end
  end

  def test_plain_to_json_es
    profile_response = File.read(Dir.getwd + "/resources/personality-v3-expect4.txt")
    personality_text = File.read(Dir.getwd + "/resources/personality-v3-es.txt")
    headers = {
      "Content-Type" => "application/json"
    }
    expected_response = DetailedResponse.new(status: 200, body: profile_response, headers: headers)
    stub_request(:post, "https://gateway.watsonplatform.net/personality-insights/api/v3/profile?version=2017-10-13")
      .with(
        body: personality_text,
        headers: {
          "Accept" => "application/json",
          "Accept-Language" => "es",
          "Authorization" => "Basic dXNlcm5hbWU6cGFzc3dvcmQ=",
          "Content-Language" => "es",
          "Content-Type" => "text/plain;charset=utf-8",
          "Host" => "gateway.watsonplatform.net:443"
        }
      ).to_return(status: 200, body: profile_response.to_json, headers: headers)
    service = PersonalityInsightsV3.new(
      version: "2017-10-13",
      username: "username",
      password: "password"
    )
    service_response = service.profile(
      content: personality_text,
      content_type: "text/plain;charset=utf-8",
      content_language: "es",
      accept_language: "es"
    )
    assert(expected_response.status == service_response.status)
    assert(expected_response.body == service_response.body)
    expected_response.headers.each_key do |key|
      assert(service_response.headers.key?(key))
      assert(expected_response.headers[key] == service_response.headers[key])
    end
  end
end
