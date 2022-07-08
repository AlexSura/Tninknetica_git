class CargoWagons < Wagon
  
  attr_reader :volume, :loading_volume, :free_volume, :number
  
  def initialize(volume)
    super
    @volume = volume
    @loading_volume = 0
    @free_volume = volume
  end

  def loading(loading_volume)
    if self.volume > volume
      puts 'вагон заполнен'
      @loading_volume = loading_volume
    else
      puts 'разделите на два вагона'
    end
  end

  def loading_volume
      @loading_volume
  end

  def free_volume
     @free_volume = @volume - @loading_volume 
  end
end
