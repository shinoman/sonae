# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :fog

  # s3のディレクトリ
  def store_dir
    "/img/up/item/#{model.id}"
  end

  version :_100x100 do
    process :resize_and_pad => [100, 100, '#fff']
  end

  version :_280x280 do
    process :resize_and_pad => [280, 280, '#fff']
  end

  version :_540x540 do
    process :resize_and_pad => [540, 540, '#fff']
  end

  version :_800x800 do
    process :resize_and_pad => [800, 800, '#fff']
  end

  # 許可する画像の拡張子
  def extension_white_list
    %w(jpg jpeg gif png)
  end


  def filename
    "img.jpg"
  end

end
