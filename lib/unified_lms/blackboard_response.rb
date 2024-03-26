# frozen_string_literal: true

require "json"

module UnifiedLms
  # Concrete response parser class for blackboard API requests
  class BlackboardResponse < Response

    # Given the response JSON from the get_students endpoint, parses the respose and displays valueble data
    # to the client
    def parse_get_students(response)

      # prints a banner
      puts("********************************")
      puts("            STUDENTS            ")
      puts("********************************")
      puts("")

      # parses the json response
      parsed = JSON.parse(response)

      # for each loop to iterate all of the results in the json response
      parsed["results"].each do |user|

        # start a new member entry
        puts("--------------------------------")

        # Print user name
        puts("Full Name: " + user["user"]["name"]["given"] + " " + user["user"]["name"]["middle"] + " " +
          user["user"]["name"]["family"])
        puts("")
        puts("Preferred Name: " + user["user"]["name"]["preferredDisplayName"])
        puts("")

        # Print user student id
        puts("Student id: " + user["user"]["studentId"])
        puts("")

        # Print User Role
        puts("Course Role: " + user["courseRoleId"])
        puts("")

        # Print Gender
        puts("Gender: " + user["user"]["gender"])
        puts("")

        # Print Pronouns
        puts("Pronouns: " + user["user"]["pronouns"])
        puts("")

        # Print Birthday
        puts("Pronouns: " + user["user"]["birthDate"])
        puts("")

        # Print Education Level
        puts("Education level: " + user["user"]["educationLevel"])
        puts("")

        # Print Contact info
        puts("Institution Email: " + user["user"]["contact"]["institutionEmail"])
        puts("")
        puts("Mobile Phone: " + user["user"]["contact"]["mobilePhone"])
        puts("")
        puts("Home Phone: " + user["user"]["contact"]["homePhone"])
        puts("")

        #Print Address info
        puts("Address1 : " + user["user"]["address"]["street1"])
        puts("           " + user["user"]["address"]["city"] + ", " + user["user"]["address"]["state"] + " " +
          user["user"]["address"]["zipCode"] + " " + user["user"]["address"]["country"])
        puts("")

        # End the member entry
        puts("--------------------------------")
        puts("")
      end

    end
  end
end
