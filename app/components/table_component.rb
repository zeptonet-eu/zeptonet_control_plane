# frozen_string_literal: true

class TableComponent < ViewComponent::Base
  def initialize(collection:, columns:)
    @collection = collection
    @columns = columns
  end

  private

  attr_reader :collection, :columns
end
