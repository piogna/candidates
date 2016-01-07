# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.detect { |candidate| candidate[:id] == id }
end

def experienced?(candidate)
  return candidate[:years_of_experience] >= 2
end

def qualified_candidates(candidates)
  qualified_candidates_list = candidates.select do |candidate|
    qualified_candidate? candidate
  end
  ordered_by_qualifications qualified_candidates_list
end

def qualified_candidate?(candidate)
  return experienced?(candidate) && knows_python_or_ruby?(candidate) &&
    over_17?(candidate) && enough_points?(candidate) &&
    applied_recently?(candidate)
end

def knows_python_or_ruby?(candidate)
  return (candidate[:languages].include? "Python" ||
          candidate[:languages].include?("Ruby"))
end

def over_17?(candidate)
  return candidate[:age] > 17
end

def enough_points?(candidate)
  return candidate[:github_points] >= 100
end

def applied_recently?(candidate)
  return (Date.today - candidate[:date_applied]).to_i <= 15
end

def ordered_by_qualifications(candidates)
  candidates.sort_by { |candidate| [candidate[:experience],
                                    candidate[:github_points]] }
end
# More methods will go below
# Applied in the last 15 days
