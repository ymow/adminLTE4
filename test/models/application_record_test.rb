require "test_helper"

class ApplicationRecordTest < ActiveSupport::TestCase
  test "ApplicationRecord inherits from ActiveRecord::Base" do
    assert ApplicationRecord < ActiveRecord::Base
  end

  test "ApplicationRecord is configured as primary abstract class" do
    assert ApplicationRecord.abstract_class?
  end

  test "ApplicationRecord has expected ActiveRecord functionality" do
    # Test that it has the expected class methods
    assert_respond_to ApplicationRecord, :connection
    assert_respond_to ApplicationRecord, :table_name
    assert_respond_to ApplicationRecord, :primary_key
  end
end