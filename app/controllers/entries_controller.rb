class EntriesController < ApplicationController

def new
  if current_user.nil?
    redirect_to "/sessions/new"
  end
end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["user_id"] = current_user["id"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry.save
    @entry.uploaded_image.attach(params["uploaded_image"])
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
