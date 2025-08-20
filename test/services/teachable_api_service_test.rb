require "test_helper"

class TeachableApiServiceTest < ActiveSupport::TestCase
  def setup
    @service = TeachableApiService.new
    @course_id = 2002430
    @user_id = 108775125
  end

  test "get_all_courses returns courses" do
    @service.stub(:get_request, fake_courses_response) do
      result = @service.get_all_courses
      assert_equal 2, result.size
      assert_equal "Marina's Test Course", result.first["name"]
      assert_equal @course_id, result.first["id"]
    end
  end

  test "get_all_enrollments returns enrollments" do
    @service.stub(:get_request, fake_enrollments_response) do
      result = @service.get_all_enrollments(@course_id)
      assert_equal 3, result.size
      assert_equal @user_id, result.first["user_id"]
    end
  end

  test "get_one_user returns user data" do
    @service.stub(:get_request, fake_user_response) do
      result = @service.get_one_user(@user_id)
      assert_equal "Suresh Travis", result["name"]
      assert_equal "suresh.travis@test.com", result["email"]
    end
  end

  test "fetch_all_pages returns all items across multiple pages" do
    # Simulate multiple pages with a counter
    call_count = 0
    @service.define_singleton_method(:get_request) do |url|
      call_count += 1
      case call_count
      when 1
        {
          "items" => [ { "id" => 1 }, { "id" => 2 } ],
          "meta" => { "page" => 1, "number_of_pages" => 2 }
        }
      when 2
        {
          "items" => [ { "id" => 3 } ],
          "meta" => { "page" => 2, "number_of_pages" => 2 }
        }
      end
    end

    results = @service.fetch_all_pages("fake_url")
    assert_equal 3, results.size
    assert_equal [1, 2, 3], results.map { |i| i["id"] }
  end
end
