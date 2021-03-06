module QGame
  module Collidable
    @@collidables = []

    def collides_as(flag)
      @collide_flag = flag

      @@collidables << self
    end

    def collide_flag
      @collide_flag
    end

    def collides_with(flag, &block)
      @on_collision = {} if @on_collision.nil?
      @on_collision[flag] = block
    end

    def can_collide_with?(other)
      @on_collision.has_key? other.collide_flag
    end

    def collide_with(other)
      self.instance_exec(other, &@on_collision[other.collide_flag])
    end

    def check_collisions
      self.calculate_position
      
      @@collidables.each do |collidable|
        next if collidable == self
        next unless self.can_collide_with?(collidable)
        
        self.collide_with(collidable) if collidable.has_collided?(self)
      end
    end
  end
end
