require 'nokogiri'

def create_project_hash

  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  project_array = kickstarter.css("li.project.grid_4")
  project_hash = {}
  project_array.each do |project|
    project_hash[project.css(".bbcard_name").text] = {
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("ul.project-meta").text,
      :percent_funded => project.css("li.first funded").text.to_i
    }
  end
  project_hash
end