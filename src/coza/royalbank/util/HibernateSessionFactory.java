package coza.royalbank.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

/**
 * Singleton for the org.hibernate.SessionFactory class. It only needs to be created and configured once in an application and can be reused anywhere.
 * @author Darren Woods
 *
 */

public class HibernateSessionFactory {
	private static SessionFactory sessionFactory;
	private static ServiceRegistry serviceRegistry;
	
	/**
	 * This method will build the Session Factory for Hibernate with default configuration (Read the hibernate.cfg.xml from the src root).
	 * The SessionFactory instance is required to create any Session so that objects can be saved or retrieved.
	 * @return
	 * The created SessionFactory
	 */

	public static SessionFactory getSessionFactory() {
		if (sessionFactory == null) {
			Configuration configuration = new Configuration();
			configuration.configure();
			serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
			sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		}
		return sessionFactory;
	}

	public static ServiceRegistry getServiceRegistry() {
		return serviceRegistry;
	}
}