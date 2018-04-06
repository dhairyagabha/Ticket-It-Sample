TicketIt.setup do |config|

  # Resource is who onws the tickets as assigner, Configure resource class name.
  config.resource_class = 'User'

  # Ticket Priorities %w(high critical blocker low)
  # config.ticket_priorities = %w()

  # Ticket Types %w(technical business billing permissions)
  config.ticket_types = %w(technical business billing permissions)

  # Ticket Statuses %w(new work_in_progress quality_check closed) make sure it is in sequence
  # config.ticket_status = %w()

  # Sign in url required for the accessing ticket_it in your app.
  config.sign_in_url = '/users/sign_in'

end