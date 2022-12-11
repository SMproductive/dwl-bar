#include <gtk/gtk.h>

static void activate(GtkApplication *app, gpointer user_data) {
  GtkWidget *window;
  GtkWidget *bar;

  window = gtk_application_window_new(app);
  gtk_window_set_title(GTK_WINDOW(window), "dwl-bar");
  gtk_window_fullscreen(window);
  gtk_window_set_default_size(window, gtk_widget_get_width(window), 100);
  /* gtk_widget_set_size_request(window, gtk_widget_get_width(window), 100); */
  gtk_window_set_resizable(window, false);

  gtk_widget_show(window);

  bar = gtk_label_new("label");
  gtk_window_set_child(GTK_WINDOW(window), bar);

  gtk_window_present(GTK_WINDOW(window));
}

int main(int argc, char **argv) {
  GtkApplication *app;
  int status;

  app = gtk_application_new("dwl.bar", G_APPLICATION_FLAGS_NONE);
  g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);
  status = g_application_run(G_APPLICATION(app), argc, argv);
  g_object_unref(app);

  return status;
}

/* TODO
 * Handle DWL string
 * FIFO
 * Window top
 * Window size
 * Style */
