# frozen_string_literal: true
module JobFilters

  # Implements fixed rate jobs filtering
  class FixedRateFilter

    BAD_WORDS = %w(psd php odoo yii mql4 seo java wcf asp).freeze
    BAD_SUBSTRINGS = %w(moodle woocommerce magento phpbb wordpress laravel joomla python duplicate prestashop drupal) +
                     %w(salesforce sakai asp.net opencart verilog codeigniter cakephp oscommerce mediawiki smarty) +
                     %w(whmcs telerik bigcommerce) +
                     ['business catalyst', 'mql 4', 'zen cart', 'word press', 'gravity forms']
    MAX_BUDGET = 1000
    MIN_BUDGET = 50

    def self.good_job?(job_data)
      return false if bad_budget?(job_data['budget'].to_i)

      title_downcased = job_data['title'].downcase
      return false if BAD_WORDS.any? { |bad_word| title_downcased =~ /\b#{bad_word}\b/ }
      return false if BAD_SUBSTRINGS.any? { |bad_susbstr| title_downcased[bad_susbstr] }
      return false if bad_skills?(job_data['skills'])

      true
    end

    def self.bad_budget?(budget)
      return true if budget > MAX_BUDGET
      return true if budget < MIN_BUDGET
    end

    def self.bad_skills?(skills)
      skills.size == 1 && BAD_WORDS.include?(skills[0])
    end

  end

end
