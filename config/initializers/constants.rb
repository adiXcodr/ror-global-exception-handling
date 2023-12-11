RESPONSE_CODE_MAP = {
  '40000' => { http_status: :bad_request, message: 'Invalid schema' },
  '40001' => { http_status: :bad_request, message: 'Unprocessable number' },
  # .....
  '40101' => {
    http_status: :unauthorized,
    message: 'Inaccurate credentials'
  },
  # .....
  '40401' => { http_status: :not_found, message: 'Resource not found' },
  '40402' => { http_status: :not_found, message: 'User not found' }
}.freeze
