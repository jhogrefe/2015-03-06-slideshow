DATABASE.results_as_hash = true
                   
DATABASE.execute("CREATE TABLE IF NOT EXISTS contents
                  (id INTEGER PRIMARY KEY,
                  slide_order INTEGER,
                  title TEXT,
                  body TEXT)")