# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Familiesテーブル
| column | Type   | Options     |
|--------|--------|-------------|
| name   | string | null: false |

### Association
- has_many :users, through: :family_users
- has_many :tasks
- has_many :schedules
- has_many :day_tasks


## Usersテーブル
| column             | Type   | Options                    |
|--------------------|--------|----------------------------|
| nickname           | string | null: false                |
| email              | string | null: false, unique: true  |
| encrypted_password | string | null: false                |

### Association
- has_many :families, through: :family_users
- has_many :day_tasks
- has_many :schedules

## FamilyUsersテーブル
| column    | Type       | Options                        |
|-----------|------------|--------------------------------|
| family_id | references | null: false, foreign_key: true |
| user_id   | references | null: false, foreign_key: true |

## Association
- belongs_to :family
- belongs_to :user

## Tasksテーブル
| column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| content     | string     | null: false                    |
| category_id | integer    | null: false                    |
| family_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :family
- has_many :day_tasks

## DayTasksテーブル
| column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| action_day  | date       | null: false                    |
| task_id     | references | null: false, foreign_key: true |
| user_id     | references | null: false, foreign_key: true |
| family_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :task
- belongs_to :user
- belongs_to :family

## Schedulesテーブル
| column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| event       | string     | null: false                    |
| start_time  | datetime   | null: false                    |
| end_time    | datetime   | null: false                    |
| family_id   | references | null: false, foreign_key: true |
| user_id     | references | null: false, foreign_key: true |

### Assosiation
- belongs_to :family
- belongs_to :user