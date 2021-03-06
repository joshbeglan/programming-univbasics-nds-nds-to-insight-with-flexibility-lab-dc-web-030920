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
  array = []
  i = 0
  while i < movies_collection.length
    movie = movies_collection[i]
    name_added = movie_with_director_name(name, movie)
    array << name_added
    i += 1
  end
  array
end


def gross_per_studio(collection)
  gross_hash = {}
  i = 0
  while i < collection.length
    movie = collection[i]
    studio = movie[:studio]
    gross = movie[:worldwide_gross]
    if gross_hash[studio]
      gross_hash[studio] += gross
    else
      gross_hash[studio] = gross
    end
    i += 1
  end
  gross_hash
end

def movies_with_director_key(name, movies_collection)
  array = []
  i = 0
  while i < movies_collection.length
    movie = movies_collection[i]
    name_added = movie_with_director_name(name, movie)
    array << name_added
    i += 1
  end
  array
end

def movies_with_directors_set(source)
  movies_array = []
  i = 0
  while i < source.length
    director = source[i]
    director_name = director[:name]
    movies = director[:movies]
    new_movies = movies_with_director_key(director_name, movies)
    movies_array << new_movies
    i += 1
  end
  movies_array
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
