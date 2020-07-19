class ImgController < ApplicationController
    def index 
        @images = Img.all
    end
end
