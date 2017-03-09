class PhotoPresenter < SimpleDelegator

  def labels_to_str
    if annotation.present?
      annotation.labels.map{ |label| label.downcase.parameterize.prepend('#') }.join(' ')
    end.presence || ""
  end

  def show_faces?
    annotation.present? && annotation.faces.present?
  end

  def logos
    annotation.logos
  end

  def amazone_search_url(logo)
    "https://www.amazon.com/s?field-keywords=#{URI.escape(logo)}"
  end

  def landmarks
    annotation.landmarks.map{ |landmark| google_maps_params(landmark) }
  end

  def google_maps_params(landmark)
    description, latitude, longitude = landmark.split(',')
    {
      description: description,
      url: "http://www.google.com/maps/place/#{latitude},#{longitude}"
    }
  end
end
