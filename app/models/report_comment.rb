class ReportComment < ApplicationRecord
    belongs_to :customer
    belongs_to :report

    validates :comment, presence: true
end
