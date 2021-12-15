class Array

  def lab_rotate(value = 1)
    shift = value % length

    if shift.zero?
      self
    else
      last(length - shift) + first(shift)
    end
  end

  def lab_rotate!(value = 1)
    shift = value % size

    if shift.zero?
      self
    else
      replace(lab_rotate(shift))
    end
  end
end
