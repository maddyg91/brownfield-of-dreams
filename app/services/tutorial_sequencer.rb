class TutorialSequencer
  def initialize(tutorial, sequenced_video_ids)
    @tutorial = tutorial
    @sequenced_video_ids = sequenced_video_ids
  end

  def run!
    update_position_if_changed!
  end

  private
  attr_reader :tutorial, :sequenced_video_ids

  def videos
    tutorial.videos.to_a
  end

  def update_position_if_changed!
    sequenced_video_ids.each.with_index(1) do |video_id, index|
      video = find_video(video_id)
      video.update(position: index) if video.position != index
    end
  end
  
  def find_video(video_id)
    videos.find do |video|
      video.id == video_id.to_i
    end
  end
end
