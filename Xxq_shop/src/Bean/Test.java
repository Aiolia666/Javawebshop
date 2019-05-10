package Bean;

import Model.User;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		User user=new User();
		UserDao userDao=new UserDao();
		user.setUsername("王翌淞");
		user.setPassword("2016");
		user.setType(1);
		//userDao.add(user);

	}

}
