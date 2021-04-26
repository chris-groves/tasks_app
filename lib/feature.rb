class Feature
  def self.enabled?(feature_name)
    case feature_name
    when :new_tasks_link
      FeatureFlag.exists?(name: "new_tasks_link", enabled: true)
    else
      false
    end
  end
end
