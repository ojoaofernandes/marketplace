module HomeHelper
  def card_image src
    default_src = 'data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22260%22%20height%3D%22180%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20260%20180%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_16020060b3a%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A13pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_16020060b3a%22%3E%3Crect%20width%3D%22260%22%20height%3D%22180%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2296.078125%22%20y%3D%2296%22%3EPhoto%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E'
    src = default_src if src.file.nil?

    image_tag src, class: "card-img-top"
  end

  def summarize text
    text[0..60] + "..."
  end
end
