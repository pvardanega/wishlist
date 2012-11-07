import com.pvardanega.Role
import com.pvardanega.User
import com.pvardanega.UserRole

class BootStrap {

    def init = { servletContext ->
        environments {
            development {
                def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
                def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

                def testUser = new User(username: 'me', email: 'test@yopmail.com',
                        firstname: 'firstname', lastname: 'lastname', enabled: true,
                        password: 'password')
                testUser.save(flush: true)

                UserRole.create testUser, adminRole, true
//                UserRole.create testUser, adminRole, true
            }
        }
    }
    def destroy = {
    }
}
