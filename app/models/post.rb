class Post < ApplicationRecord
  has_one_attached :thumbnail
  enums :publisher, %w[zmacar telanon]
  before_validation :extract_publisher, if: -> { external_url.present? }
  validates :title, :publisher, :date, presence: true
  validate :content_or_external_url
  before_save :set_default_published_date

  private

  def content_or_external_url
    if content.blank? && external_url.blank?
      errors.add(:base, 'Either content or external URL must be present')
    elsif content.present? && external_url.present?
      errors.add(:base, 'Only one of content or external URL can be present')
    end
  end

  def extract_publisher
    self.publisher = URI.parse(external_url).host.split('.')[-2]
  end

  def set_default_published_date
    self.published_date ||= Date.current
  end
end
