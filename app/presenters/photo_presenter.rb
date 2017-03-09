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
end
