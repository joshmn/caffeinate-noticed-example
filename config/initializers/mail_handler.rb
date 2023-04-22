class MailHandler
  def initialize(*)
  end

  def deliver!(mail)
    path = Rails.root.join("tmp", "#{SecureRandom.hex}.html")
    File.open(path, "w") do |f|
      f.write("<pre>#{mail.header.to_s}</pre>")
      f.write(mail.body.to_s)
    end
    system("open #{path}")
  end

  def settings
    {}
  end
end
