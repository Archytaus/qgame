module QGame
  class Sprite
  end

  class AnimatedSprite < Sprite
    def initialize(args = {})
      super(args)

      @frame_size = args[:frame_size] || Vec2.new
      @scale = args[:frame_size] || args[:scale] || @texture.size

      @frames = []
      @current_frame = 0

      @animating = args[:started]
      @animating = true unless args.has_key? :started
      
      @frame_rate = args[:frame_rate] || 30
      @animation_offsets = args[:animations] || {}
      @animations = {}

      calculate_frame_positions
      calculate_animations

      @current_animation = args.has_key?(:default_animation) ? @animations[args[:default_animation]] : @frames
    end
    
    def calculate_frame_positions
      frames_horizontally = (@texture.width / @frame_size.x).to_i
      frames_vertically = (@texture.height / @frame_size.y).to_i
      
      @frames = []

      (0...frames_vertically).each do |offset_y|
        (0...frames_horizontally).each do |offset_x|
          @frames << Vec2.new(offset_x * @frame_size.x / @texture.width, offset_y * @frame_size.y / @texture.height)
        end
      end
    end

    def calculate_animations
      @animation_offsets.each do |animation, offsets|
        @animations[animation] = offsets.map {|offset| @frames[offset]}
      end
    end

    def frame_offset
      @frame_size / @texture.size
    end

    def start
      @animating = true
      @current_frame = 0
    end

    def stop
      @animating = false
    end

    def loop_animation(animation)
      @current_animation = @animations[animation]
    end

    def update
      if @animating
        @current_frame += @frame_rate * Application.elapsed
        @current_frame = 0 if @current_frame >= @current_animation.length
      end

      super
    end

    def render
      shader.set_uniform(:view, QGame::Application.render_manager.camera.view)
      shader.set_uniform(:position, @position)
      shader.set_uniform(:rotation, @rotation)
      shader.set_uniform(:scale, @scale)
      shader.set_uniform(:offset, @offset)
      shader.set_uniform(:sprite_offset, @current_animation[@current_frame.to_i])
      shader.set_uniform(:sprite_scale, frame_offset)
      shader.set_uniform(:z_index, @z_index)
      shader.set_uniform(:transparency, @absolute_transparency)
      
      model.render
    end
  end
end
