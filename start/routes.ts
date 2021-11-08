import Route from '@ioc:Adonis/Core/Route'

Route.get('/', async () => {
  return { hello: 'world' }
})

Route.group(() => {
  Route.post('/login', 'AuthController.login')
  Route.post('/register', 'AuthController.register')
  Route.get('/check', 'AuthController.check')
  Route.post('/logout', 'AuthController.logout')
  Route.group(() => {
    Route.get('/admin/meetings', 'MeetingsController.getAdminMeetings')
    Route.get('/meetings/all', 'MeetingsController.allMeets')
    Route.get('/meetings/week', 'MeetingsController.weekMeets')
    Route.put('/meetings/add/:id', 'MeetingsController.addToMeeting')
    Route.put('/meetings/remove/:id', 'MeetingsController.removeFromMeeting')
    Route.get('/user/meetings', 'MeetingsController.getUserMeetings')

    Route.group(() => {
      Route.resource('/users', 'UsersController').apiOnly()
      Route.resource('/meetings', 'MeetingsController').apiOnly()
    }).middleware('admin')
  }).middleware('auth')
})
  .prefix('/api')
  .middleware('silent_auth')
