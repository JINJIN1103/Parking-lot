class ReportComment < ApplicationRecord
    belongs_to :customer
    belongs_to :report
end
