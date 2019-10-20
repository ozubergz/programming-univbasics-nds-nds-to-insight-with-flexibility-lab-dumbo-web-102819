# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  aoh = []
  movies_collection.map do |movie|
    h = movie_with_director_name(name, movie)
    aoh.push(h)
  end
  aoh
end


def gross_per_studio(collection)
  new_hash = {}
  collection.map do |movie|
    new_hash[movie[:studio]] = 0
  end
  
  result = {}
  new_hash.each do |studio, gross|
    collection.map do |movie|
      if(studio == movie[:studio])
        gross += movie[:worldwide_gross]
      end
    end
    result[studio] = gross
  end
  result
end

def movies_with_directors_set(source)
  aoa = []
  source.map do |elem|
    name = elem[:name]
    movies_coll = elem[:movies]
    aoa.push(movies_with_director_key(name, movies_coll))
  end
  aoa
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
