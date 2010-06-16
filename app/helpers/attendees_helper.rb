module AttendeesHelper
  def sign(answer)
    signs = ['-','X','△','O']
    signs[answer]
  end
end
