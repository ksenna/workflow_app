class CreateUsersCourses < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
    end
    create_table :courses do |t|
      t.string :name
      t.text :description
    end
    create_table :locations do |t|
      t.string :city
      t.string :state
    end
    create_table :cohorts do |t|
      t.integer :course_id
      t.integer :location_id
      t.integer :instructor_id
      t.date :start_date
      t.date :end_date
    end
    create_table :assignments do |t|
      t.string :title
      t.text :description
      t.integer :cohort_id
    end
    create_table :submissions do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.integer :assignment_id
      t.string :status
      t.timestamps
    end
    create_table :comments do |t|
      t.integer :user_id
      t.text :content
      t.integer :commentable_id
      t.string :commentable_type
      t.timestamps
    end
  end
end
