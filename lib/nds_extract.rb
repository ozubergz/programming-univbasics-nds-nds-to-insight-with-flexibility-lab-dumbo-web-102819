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
  result = []
  movies_collection.map do |elem|
    result.push(movie_with_director_name(name, elem))
  end
  result
end


def gross_per_studio(collection)
  new_hash = {}

  collection.map do |elem|
    studio = elem[:studio]
    new_hash[studio] = 0
  end
  
  result = {}
  new_hash.each do |k, v|
    total = 0
    collection.map do |elem|
      if (k == elem[:studio])
        total += elem[:worldwide_gross]
        result[k] = total
      end
    end
  end
  result
end

def movies_with_directors_set(source)
  aoa = []
  source.map do |elem|
    name = elem[:name]
    movies = elem[:movies]
    movies.map do |val|
      title = val[:title]
      aoa.push([{
        :title => title,
        :director_name => name
      }])
    end
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
