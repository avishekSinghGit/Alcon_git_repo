Then(/^I check that the channel section is removed from contact details$/) do
  sleep 5
  if page.has_content?("Channel")
    writeFailure "channel section is not removed from contact details"
  else
    puts "channel section is removed from contact details"
  end
end

