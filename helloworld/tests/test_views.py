from django.test import TestCase
from django.urls import reverse
from django.contrib.auth.models import User

class HelloWorldViewTests(TestCase):
    def test_hello_world_view(self):
        """
        Test the hello world view returns a 200 status code and the correct content.
        """
        response = self.client.get(reverse('index'))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, "Hello, world!\n")

    def test_admin_view(self):
        """
        Test the admin view returns a 200 status code.
        """
        # Create a superuser
        User.objects.create_superuser(username='admin', email='admin@mail.com', password='adminpass')
        # Log in the superuser
        self.client.login(username='admin', password='adminpass')
        # Access the admin view
        response = self.client.get(reverse('admin:index'))
        self.assertEqual(response.status_code, 200)
