module FakeTeachableResponses
  def fake_courses_response
    {
      "courses" => [
        {
          "id" => 2002430,
          "description" => nil,
          "name" => "Marina's Test Course",
          "heading" => "Grow Your Knowledge of Marina's Test Course - Learn From the Expert!",
          "is_published" => true,
          "image_url" => "https://uploads.teachablecdn.com/attachments/S1vHFU7wSgCOWlBN5PxF_tree.jpg"
        },
        {
          "id" => 2002431,
          "description" => nil,
          "name" => "Mushroom Madness",
          "heading" => "Unlock the Secrets of Mushroom Foraging with Mushroom Madness",
          "is_published" => true,
          "image_url" => "https://uploads.teachablecdn.com/attachments/ZedF0hSMRLp13m4JuqMA_mushroom.jpg"
        }
      ],
      "meta" => {
        "total" => 2,
        "page" => 1,
        "from" => 1,
        "to" => 2,
        "per_page" => 20,
        "number_of_pages" => 1
      }
    }
  end

  def fake_enrollments_response
    {
      "enrollments" => [
        {
          "user_id" => 108775125,
          "enrolled_at" => "2024-07-25T14:18:59Z",
          "completed_at" => nil,
          "percent_complete" => 0,
          "expires_at" => nil
        },
        {
          "user_id" => 108775122,
          "enrolled_at" => "2024-07-25T14:18:59Z",
          "completed_at" => nil,
          "percent_complete" => 0,
          "expires_at" => nil
        },
        {
          "user_id" => 108775121,
          "enrolled_at" => "2024-07-25T14:18:58Z",
          "completed_at" => nil,
          "percent_complete" => 0,
          "expires_at" => nil
        }
      ],
      "meta" => {
        "total" => 3,
        "page" => 1,
        "from" => 1,
        "to" => 3,
        "per_page" => 0,
        "number_of_pages" => 1
      }
    }
  end

  def fake_user_response
    {
      "email" => "suresh.travis@test.com",
      "name" => "Suresh Travis",
      "src" => nil,
      "role" => "student",
      "last_sign_in_ip" => nil,
      "id" => 108775125,
      "courses" => [
        {
          "course_id" => 2002431,
          "course_name" => "Mushroom Madness",
          "enrolled_at" => "2024-07-25T14:18:59Z",
          "is_active_enrollment" => true,
          "completed_at" => nil,
          "percent_complete" => 10
        },
        {
          "course_id" => 2002430,
          "course_name" => "Marina's Test Course",
          "enrolled_at" => "2024-07-25T14:21:01Z",
          "is_active_enrollment" => true,
          "completed_at" => nil,
          "percent_complete" => 0
        }
      ],
      "tags" => []
    }
  end
end
