# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  long_url   :string           not null
#  short_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord
    validates :long_url, :user_id, presence: true

    # ShortenedUrl::random_code that uses SecureRandom::urlsafe_base64 to generate a random 16-byte string.

    if new_record?(self)  #new_record? Returns true if this object hasn't been saved yet – that is, a record for the object doesn't exist in the database yet; otherwise, returns false.
        after_initialize do |shortenedurl|
            short_url = ShortenedUrl.random_code
        end
    end

    def self.random_code
        exist_check = true
        temp_url = 0

        while exist_check
        temp_url = SecureRandom.urlsafe_base64(22)
        exist_check = ShortenedUrl.exists?(:short_url => temp_url)
        end

        temp_url
    end

end
