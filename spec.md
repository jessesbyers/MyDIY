Specifications for the Rails Assessment
Specs:

X    Using Ruby on Rails for the project
        # Done. Used Ruby on Rails framwork without using scaffolds.

X    Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
        # There are several examples, including:
            # User: has many Collaborations, Images, Resources, and Goals

X    Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
        # There are several examples, including:
            # Goal: belongs to Project
            # Image: belongs to Goal
            # Resource: belongs to Goal
            # Update: belongs to Goal

X    Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many                  Items through Ingredients)
        # There are several examples, including:
            # User has many Projects through Collaborations,  
            # Project has many Images through Goals


X    Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g.               Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
        #  User has many Projects through Collaborations, and Projects have many Users through Collaborations

X    The "through" part of the has_many through includes at least one user submittable attribute, that is               to say, some attribute other than its foreign keys that can be submitted by the app's user                          (attribute_name e.g. ingredients.quantity)
        # The Collaboration Join Table includes user_id, project_id, and role (user_submitted entry)

X    Include reasonable validations for simple model objects (list of model objects with validations e.g.               User, Recipe, Ingredient, Item)
        # User
            # validates :email, presence: true, uniqueness: true
            # validates :username, presence: true, uniqueness: true
            # validates :password, length: { :minimum => 6}
            # validates_confirmation_of :password
        # Collaboration
            # validates :user_id, uniqueness: { scope: :project_id, message: ": A collaboration already exists with this user on this project." }
            # validates :project_id, uniqueness: { scope: :user_id, message: ": A collaboration already exists with this user on this project." }
            # ROLE_OPTIONS = ["Primary Project Owner", "Project Owner", "Update and View", "View Only"]
            # validates :role, presence: true, inclusion: ROLE_OPTIONS
        # Project
            # validates :address, presence: true, uniqueness: true
            # validates :overview, presence: true
        # Goal
            # validates :title, presence: true
            # validates :description, presence: true
            # validates :budget, presence: true, numericality: true
            # STATUS_OPTIONS = ["Not Started", "Incomplete", "Completed"]
            # validates :status, presence: true, inclusion: STATUS_OPTIONS
        # Image
            # validates :url, presence: true, format: { with: %r{.(gif|jpg|png)\Z}i, message: "must be a URL for GIF, JPG or PNG image." }
            # GENRE_OPTIONS = ["Inspiration", "Design Plans", "Before Photo", "After Photo", "Work in Progress"]
            # validates :genre, presence: true, inclusion: GENRE_OPTIONS
            # validates :caption, presence: true
        # Resource
            # validates :url, presence: true, format: { with: URI.regexp }
            # validates :description, presence: true
        # Update
            # validates :content, presence: true

X    Include a class level ActiveRecord scope method (model object & class method name and URL to see the               working feature e.g. User.most_recipes URL: /users/most_recipes)
        # Goal.completed
            # scope :completed, -> { where(status: 'Completed') }
            # URL: /goals/completed

X    Include signup (how e.g. Devise)
        # /signup - created manually

X    Include login (how e.g. Devise)
        # /login - created manually

X    Include logout (how e.g. Devise)
        # form posts to /logout in navbar - created manually

X    Include third party signup/login (how e.g. Devise/OmniAuth)
        # OmniAuth login with google account

X    Include nested resource show or index (URL e.g. users/2/recipes)
        # Index pages for images, updates, and resources nested within goal
            # Example: /goals/8/images

X    Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
        # New form for images, updates, and resources nested within goal
            # Example: /goals/8/images/new

X    Include form display of validation errors (form URL e.g. /recipes/new)
        # Validation errors displayed on all new and edit forms except login form, which includes a flash message if user does not exist.

Confirm:

 The application is pretty DRY
 Limited logic in controllers
 Views use helper methods if appropriate
 Views use partials if appropriate