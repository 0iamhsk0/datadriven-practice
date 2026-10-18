def most_frequent(items: list) -> list:
  #base case
  if not items:
    return []
  
  # 1st couting freq
  freq = {}
  for item in items:
    freq[item] = freq.get(item, 0) + 1
    
  # 2nd finding max freq value
  max_freq = max(freq.values())
  
  # 3rd collects items with matching max freq
  ans = [key for key, count in freq.items() if count == max_freq]
  
  return sorted(ans)
