# Create local user accounts for the participants of the AWS POC.
# Each account will need some ssh key so users can login.
class aws_poc::bbp_users () {
  # A temporary test just to see if the puppet bolt setup works
  user { 'verachte':
    ensure => present,
  }
}
