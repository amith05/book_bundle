module ApplicationHelper
  def render_image(title, size)
    unless title.nil?
      name = "#{title.title}"
      unless title.isbn.nil?
        url = "http://cdn2.justbooksclc.com/medium/#{title.isbn}.jpg"
        uri = URI(url)
        request = Net::HTTP.new uri.host
        response= request.request_head uri.path
        if response.code.to_i == 403
          url="http://cdn2.justbooksclc.com/medium/#{title.isbn}.jpeg"
        end
      else
        url = "http://cdn2.justbooksclc.com/title/#{title.id}.jpg"
        uri = URI(url)
        request = Net::HTTP.new uri.host
        response= request.request_head uri.path
        if response.code.to_i == 403
          url = "http://cdn2.justbooksclc.com/medium/#{title.id}.jpg"
        end
      end
      image_tag(url, size: size, :onerror => "this.src='http://cdn2.justbooksclc.com/title/0.jpg';")
    end
  end
end
