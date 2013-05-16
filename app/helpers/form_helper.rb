module FormHelper
  def setup_girl(girl)
    girl.photo ||= Photo.new
    girl
  end
end