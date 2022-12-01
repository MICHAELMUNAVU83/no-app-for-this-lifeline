# rubocop: disable Metrics/MethodLength

class Patient < ApplicationRecord
  has_many :next_of_kins
  has_many :drug_allergies
  has_many :food_allergies
  has_many :pre_existing_conditions
  belongs_to :doctor

  has_one_attached :qr_code
  has_one_attached :image

  def patient_age
    self.date_of_birth.strftime('%d/%m/%Y')
    now = Time.now.utc.to_date
    return now.year - date_of_birth.year - ((now.month > date_of_birth.month || (now.month == date_of_birth.month && now.day >= date_of_birth.day)) ? 0 : 1)
   
  end




  include Rails.application.routes.url_helpers

  after_create :generate_qr
  def generate_qr
    qr_url = url_for(controller: 'patients',
                     action: 'show',
                     id: id,
                     only_path: false,
                     host: 'https://arsenaltop.herokuapp.com/',
                     source: 'from_qr')
    qrcode = RQRCode::QRCode.new(qr_url)

    png = qrcode.as_png(
      resize_gte_to: false,
      resize_exactly_to: false,
      fill: 'white',
      color: 'black',
      size: 250,
      border_modules: 4,
      module_px_size: 6,
      file: nil # path to write
    )
    image_name = SecureRandom.hex
    File.binwrite("tmp/#{image_name}.png", png.to_s)

    blob = ActiveStorage::Blob.create_and_upload!(
      io: File.open("tmp/#{image_name}.png"),
      filename: image_name,
      content_type: 'png'
    )

    qr_code.attach(blob)
  end
end
# rubocop: enable Metrics/MethodLength
